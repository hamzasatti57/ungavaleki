class LoanMailer < ApplicationMailer

  default from: "hamza.satti063@gmail.com"

  def loan_request(user)
    @user = user
    mail(to: "alisheikh4021@gmail.com", from: "Ungavaleki <hamza.satti063@gmail.com>", :subject=> "Loan request received" )
  end

  def loan_paid(user)
    @user = user
    mail(to: "alisheikh4021@gmail.com", from: "Ungavaleki <hamza.satti063@gmail.com>", :subject=> "Loan Paid" )
  end

  def loan_return(user)
    @user = user
    mail(to: "alisheikh4021@gmail.com", from: "Ungavaleki <hamza.satti063@gmail.com>", :subject=> "Loan Returned" )
  end
end
