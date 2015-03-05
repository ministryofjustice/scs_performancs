module World
  module PageExpectations

    def check_my_approval_status(initial, mid_year, end_year)
      check_approval_status :my_approval_status, initial, mid_year, end_year
    end

    def check_employee_approval_status(initial, mid_year, end_year)
      check_approval_status :employee_approval_status, initial, mid_year, end_year
    end

    def date_format(datetime)
      if datetime.is_a?(String)
        datetime
      else
        datetime.to_date.to_s(:short).strip
      end
    end

  private

    def check_approval_status(status, initial, mid_year, end_year)
      expected_initial = date_format(initial)
      expected_mid_year = date_format(mid_year)
      expected_end_year = date_format(end_year)

      send(status) do |actual_initial, actual_mid_year, actual_end_year|
        expect(actual_initial).to eql(expected_initial)
        expect(actual_mid_year).to eql(expected_mid_year)
        expect(actual_end_year).to eql(expected_end_year)
      end
    end

    def my_approval_status
      yield dashboard.initial_approval.text,
        dashboard.mid_year_approval.text,
        dashboard.end_year_approval.text
    end

    def employee_approval_status
      yield dashboard.employee_initial_approval.text,
        dashboard.employee_mid_year_approval.text,
        dashboard.employee_end_year_approval.text
    end
  end
end

World(World::PageExpectations)
