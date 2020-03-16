module Volunteers
  class CreateForm < Reform::Form
    property :email, validates: { email: true }, virtual: true
    property :name, validates: { presence: true, length: { maximum: 250 } }, virtual: true
    property :title, validates: { presence: true, length: { maximum: 250 } }, virtual: true
    property :linkedin_url, virtual: true
    property :connect_link
    property :public
    property :school_id, virtual: true, validates: { presence: true }
    property :affiliation, virtual: true


    details = params['volunteer']
    district = District.find(details['district_id'])
    role = details['role_id']
    skill = details['skill_id']
    user = User.create!(email: details['email'], password: details['password'], district: district, age: details['age'], mobile_number: details['mobile_number'], gender: details['gender'])
    Volunteer.new(user: user, skill: skill, role: role, available: true)
    sing_in user

    def save
      Faculty.transaction do
        ::FacultyModule::CreateService.new(faculty_params).create
      end
    end

    private

    def school
      School.find_by(id: school_id)
    end

    def faculty_params
      {
        name: name,
        email: email,
        title: title,
        school: school,
        linkedin_url: linkedin_url,
        connect_link: connect_link,
        public: public,
        image: image,
        affiliation: affiliation
      }
    end
  end
end
