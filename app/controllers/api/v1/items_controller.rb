class Api::V1::ItemsController < Api::V1::BaseController
  def index
    respond_with LanguageObject.all.to_json
  end

  def create
    respond_with :api, :v1, LanguageObject.create(language_object_params)
  end

  def destroy
    respond_with LanguageObject.destroy(params[:id])
  end

  def update
    language_object = LanguageObject.find(params["id"])
    language_object.update_attributes(language_object_params)
    respond_with language_object, json: language_object
  end

  private

  def language_object_params
    params.require(:language_object).permit(:id, :submitted_by, :image_url, :object_local_language, :object_local_name, :community_group, :trust_rating)
  end
end
