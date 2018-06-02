class VocabulariesController < ApplicationController
    before_action :find_lesson, only: [:index, :create, :destroy]
    
    def index
    end
    
    def create
        @vocabulary = @lesson.vocabularies.new new_params
        
        authorize @vocabulary
        
        if @vocabulary.save
            redirect_to lesson_vocabularies_path
        end
                               
    end
    
    def destroy
        @vocabulary1 = @lesson.vocabularies.find_by id: params[:id]
        @vocabulary1.destroy
        redirect_to lesson_vocabularies_path
    end
    
    private
    def find_lesson
        @lesson = Lesson.find_by id: params[:lesson_id]
    end
  
    def new_params
        params.require(:vocabulary).permit :lesson_id, :japanese, :spell, :mean,
                                            :picture
    end
end
