require 'test_helper'

module Anticuado
  module IOS
    class CarthageTest < Minitest::Test

      OUTDATED_HAVE_UPDATE =<<-OUTDATED
*** Fetching Result
*** Fetching Himotoki
The following dependencies are outdated:
Result "2.0.0" -> "2.1.3"
      OUTDATED

      OUTDATED_NO_UPDATE =<<-OUTDATED
*** Fetching Result
*** Fetching Himotoki
All dependencies are up to date.
      OUTDATED


      def test_with_format_have_update
        result = Anticuado::IOS::Carthage.format OUTDATED_HAVE_UPDATE

        expected_0 = { library_name: "Result", current_version: "2.0.0", available_version: "2.1.3", latest_version: "2.1.3" }

        assert_equal expected_0, result[0]
      end

      def test_with_format_no_update
        result = Anticuado::IOS::Carthage.format OUTDATED_NO_UPDATE

        expected = []
        assert_equal expected, result
      end

    end
  end
end