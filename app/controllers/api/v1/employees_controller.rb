class Api::V1::EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render json: employees, status: :ok
  end

  def show
    employee = Employee.find_by(id: params[:id])
    if employee
      render json: employee, status: :ok
    else
      render json: {
        error: "Employee not found"
      }, status: :not_found
    end
  end

  def create
    employee = Employee.new(
      name: employee_params[:name],
      email: employee_params[:email]
    )
    if employee.save
      render json: employee, status: :ok
    else
      render json: {
        error: "Error in creating"}, status: :unprocessable_entity
      
    end
  end

  def update
    employee = Employee.find_by(id: params[:id])
    if employee
      employee.update(name: params[:name], email: params[:email])
      render json: "Employee Record updated", status: :ok
    else
      render json: {
        error: "Employee not found"
      },status: :not_found
    end
  end

  def destroy
    employee = Employee.find_by(id: params[:id])
    if employee
      employee.destroy
      render json: "Employee deleted successfully", status: :ok
    else
      render json: {
        error: "Employee not found"
      },status: :not_found
    end
  end
  private
  def employee_params
    params.require(:employee).permit([
      :name,
      :email
    ])
  end
end
