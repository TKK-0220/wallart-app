class DiagnosesController < ApplicationController
  def new
    @diagnosis_form = DiagnosisForm.new

    # セッションにエラー情報がある場合は復元
    if session[:diagnosis_errors].present?
      @diagnosis_form.assign_attributes(session[:diagnosis_params] || {})
      @diagnosis_form.valid?
      session[:diagnosis_errors].each do |attribute, messages|
        messages.each do |message|
          @diagnosis_form.errors.add(attribute, message)
        end
      end

      # セッションをクリア
      session.delete(:diagnosis_errors)
      session.delete(:diagnosis_params)
    end
  end

  def create
    @diagnosis_form = DiagnosisForm.new(diagnosis_params) # ← ここで diagnosis_params を使う

    if @diagnosis_form.valid?
      # 計算処理
      recommended_size = RatioLogic.new(
        @diagnosis_form.base_width,
        @diagnosis_form.location_type
      ).call

      frames = FramesChoice.new(recommended_size, @diagnosis_form.direction).call

      # セッションに診断結果を保存
      session[:diagnosis_result] = {
        recommended_size: recommended_size,
        frames: frames.pluck(:id) # ID だけ保存
      }

      # 診断結果画面にリダイレクト
      redirect_to result_diagnoses_path
    else
      # バリデーション失敗時の処理
      session[:diagnosis_errors] = @diagnosis_form.errors.messages
      session[:diagnosis_params] = diagnosis_params.to_h

      # 診断画面にリダイレクト
      redirect_to new_diagnosis_path
    end
  end

  def result
    # セッションから診断結果を取得
    result = session[:diagnosis_result]

    if result.blank?
      redirect_to new_diagnosis_path, alert: "診断を行ってください"
      return
    end

    @recommended_size = result["recommended_size"]
    @frames = Frame.where(id: result["frames"])

    # セッションをクリア
    session.delete(:diagnosis_result)
  end

  private

  def diagnosis_params
    params.require(:diagnosis_form).permit(:base_width, :location_type, :direction)
  end
end
