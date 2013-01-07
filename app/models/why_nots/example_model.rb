module WhyNots
  class ExampleModel < ActiveRecord::Base

    validates_presence_of :name
    validates_uniqueness_of :name

    before_validation { puts "before validation" }
    after_validation { puts "after validation" }
    #before_validation_on_create { puts "before validation on create" }
    #after_validation_on_create { puts "after validation on create" }
    #before_validation_on_save { puts "before validation on save" }
    #after_validation_on_save { puts "after validation on save" }
    before_save { puts "before save"; false }
    after_save { puts "after save" }
    before_create { puts "before create" }
    after_create { puts "after create" }
    before_destroy { puts "before destroy" }
    after_destroy { puts "after destroy" }
    after_commit { puts "after commit" }
    #after_commit_on_create { puts "after commit on create" }
    #after_commit_on_update { puts "after commit on update" }
    #after_commit_on_destroy { puts "after commit on destroy" }
    after_rollback { puts "after rollback" }

  end
end