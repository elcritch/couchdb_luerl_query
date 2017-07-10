


.PHONY: check-qs
# target: check-qs - Run query server tests (ruby and rspec required!)
check-qs:
	@QS_LANG=js rspec test/view_server/query_server_spec.rb
