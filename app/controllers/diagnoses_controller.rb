class DiagnosesController < ApplicationController
def new
@diagnosis_form = DiagnosisForm.new
end

def create
@diagnosis_form = DiagnosisForm.new(diagnosis_params)

if @diagnosis_form.valid?
  # 診断処理
  recommended_size = RatioLogic.new(
    @diagnosis_form.base_width,
    @diagnosis_form.location_type
  ).call

  frames = FramesChoice.new(recommended_size, @diagnosis_form.direction).call

  # セッションに診断結果を保存
  session[:diagnosis_result] = {
    recommended_size: recommended_size,
    frames: frames.pluck(:id)
  }

  redirect_to result_diagnoses_path
else
  render :new, status: :unprocessable_entity
end
end

def result
result = session[:diagnosis_result]

if result.blank?
  redirect_to new_diagnosis_path, alert: "診断を行ってください"
  return
end

@recommended_size = result["recommended_size"]
@frames = Frame.where(id: result["frames"])

session.delete(:diagnosis_result)
end

private

def diagnosis_params
params.require(:diagnosis_form).permit(:base_width, :location_type, :direction)
end
end
