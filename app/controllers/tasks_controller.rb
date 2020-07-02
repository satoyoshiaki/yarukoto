class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end

    def show
    end

    def new
      @task = Task.new
    end

    def edit
    end

    def create
      @task = current_user.tasks.build(task_params)
      respond_to do |format|
        if @task.save
          format.html { redirect_to @task, notice: 'タスクを作成しました' }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to @task, notice: 'タスクを変更しました' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'タスクを削除しました' }
        format.json { head :no_content }
      end
    end
    private



    def task_params
      params.require(:task).permit(:task_name, :description, :deadline, :status, :priority, { label_ids: [] })
    end
end
