defmodule DemoProject.Patients do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  import EctoEnum

  alias DemoProject.{
    Repo,
    OperationCode,
    OperationName,
    MkbCode,
    MainDiagnosis,
    ImplantModel,
    Departments,
    AccompanyingIllnesses,
    SurgeryName
  }

  alias DemoProject.Types.{FixationMethod, Locality, Sex, PostoperativeRelief, OutcomeOfStay}
  # import EctoEnum

  defenum(FixationMethod, cement: "cement", cementless: "cementless")
  defenum(Locality, town: "town", village: "village")
  defenum(Sex, male: "male", female: "female")
  defenum(PostoperativeRelief, yes: "yes", no: "no")
  defenum(OutcomeOfStay, discharged: "discharged", translated: "translated", gone: "gone")

  @doc """
  Схема для пациентов
  """
  schema "patients" do
    field(:org_name, :string)
    field(:mc_number, :string)
    belongs_to(:department, Departments)
    field(:birth_date, :date)
    field(:sex, Sex)
    field(:locality, Locality)
    field(:income_date, :date)
    field(:income_days, :integer)
    field(:discharge_date, :date)
    belongs_to(:mkb_code, MkbCode)
    belongs_to(:main_diagnosis, MainDiagnosis)
    field(:operation_date, :date)
    field(:extra_plan, :integer)
    belongs_to(:operation_code, OperationCode)
    belongs_to(:operation_name, OperationName)
    field(:fixation_method, FixationMethod)
    belongs_to(:implant_model, ImplantModel)
    belongs_to(:accompanying_illnesses, AccompanyingIllnesses)
    field(:postoperative_relief, PostoperativeRelief)
    field(:outcome_of_stay, OutcomeOfStay)
    belongs_to(:surgery_name, SurgeryName)

    timestamps()
  end

  @doc """
  Changeset для схемы
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [
      :org_name,
      :mc_number,
      :department_id,
      :birth_date,
      :sex,
      :locality,
      :income_date,
      :income_days,
      :discharge_date,
      :mkb_code_id,
      :main_diagnosis_id,
      :operation_date,
      :extra_plan,
      :operation_code_id,
      :operation_name_id,
      :fixation_method,
      :implant_model_id,
      :accompanying_illnesses_id,
      :postoperative_relief,
      :outcome_of_stay,
      :surgery_name_id
    ])
    |> validate_required([
      :org_name,
      :mc_number,
      :department_id,
      :birth_date,
      :sex,
      :locality,
      :income_date,
      :income_days,
      :discharge_date,
      :mkb_code_id,
      :main_diagnosis_id,
      :operation_date,
      :extra_plan,
      :operation_code_id,
      :operation_name_id,
      :fixation_method,
      :implant_model_id,
      :accompanying_illnesses_id,
      :outcome_of_stay,
      :surgery_name_id
    ])
  end

  def insert_patient(patient) do
    changeset(%__MODULE__{}, patient)
    |> Repo.insert()
  end

  def get_patient_by_id(p_id) do
    patient_query()
    |> where([p], p.id == ^p_id)
    |> Repo.one()
    |> Map.from_struct()
  end

  def get_all_patients() do
    patient_query()
    |> Repo.all()
    |> Enum.map(& Map.from_struct(&1) |> Map.drop([:__meta__]))
  end

  def patient_query() do
    department_query = from(d in Departments, select: d.name)
    mkb_code_query = from(mkb in MkbCode, select: mkb.code)
    main_diagnosis_query = from(md in MainDiagnosis, select: md.diagnosis)
    operation_code_query = from(oc in OperationCode, select: oc.code)
    operation_name_query = from(on in OperationName, select: on.name)
    implant_model_query = from(im in ImplantModel, select: im.model)
    accompanying_illnesses_query = from(ai in AccompanyingIllnesses, select: ai.name)
    surgery_name_query = from(sn in SurgeryName, select: sn.name)

    from(p in __MODULE__,
      # where: p.id == ^p_id,
      preload: [
        department: ^department_query,
        mkb_code: ^mkb_code_query,
        main_diagnosis: ^main_diagnosis_query,
        operation_code: ^operation_code_query,
        operation_name: ^operation_name_query,
        implant_model: ^implant_model_query,
        accompanying_illnesses: ^accompanying_illnesses_query,
        surgery_name: ^surgery_name_query
      ],
      order_by: [p.id],
      select: p
    )
  end

  def insert_test_patient() do
    %{
      org_name: "КГП на ПХВ \"МБ им.проф.Х.Ж.Макажанова\"",
      mc_number: "15495-2",
      department_id: 1,
      birth_date: Date.new!(1951, 8, 19),
      sex: :female,
      locality: :town,
      income_date: Date.new!(2021, 9, 17),
      income_days: 1,
      discharge_date: Date.new!(2021, 10, 12),
      mkb_code_id: 1,
      main_diagnosis_id: 5,
      operation_date: Date.new!(2021, 10, 1),
      extra_plan: 0,
      operation_code_id: 1,
      operation_name_id: 1,
      fixation_method: :cement,
      implant_model_id: 1,
      accompanying_illnesses_id: 1,
      postoperative_relief: :no,
      outcome_of_stay: :discharged,
      surgery_name_id: 1
    }
    |> insert_patient()
  end
end
