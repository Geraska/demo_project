defmodule DemoProjectWeb.PatientController do
  use DemoProjectWeb, :controller

  def patients_display(conn, _params) do
    conn
    |> json(%{patients_list: DemoProject.Patients.get_all_patients()})
  end
end
