class BackupMailer < ActionMailer::Base
  default from: "sistemamonitoria@ime.usp.br"
  add_template_helper(ApplicationHelper)
  add_template_helper(CandidaturesHelper)

  def new_candidature(candidature)
    set_parameters(candidature)
    mail(to: log_mail, subject: log_subject_new)
  end

  def edit_candidature(candidature)
    set_parameters(candidature)
    mail(to: log_mail, subject: log_subject_edit)
  end

  def delete_candidature(candidature)
    @student = candidature.student
    mail(to: log_mail, subject: log_subject_delete)
  end

  private

  def log_mail
    "monitoria.log.imeusp@gmail.com"
  end

  def log_subject_new
    "Nova inscrição do aluno #{@student.name} (#{Time.now})"
  end

  def log_subject_edit
    "Mudança na inscrição do aluno #{@student.name} (#{Time.now})"
  end

  def log_subject_delete
    "Desistência da inscrição do aluno #{@student.name} (#{Time.now})"
  end

  def set_parameters(candidature)
    @candidature = candidature
    @student = candidature.student
    @course1 = Course.find(candidature.course1_id).full_name
    if candidature.course2_id != nil
      @course2 = Course.find(candidature.course2_id).full_name
    end
    if candidature.course3_id != nil
      @course3 = Course.find(candidature.course3_id).full_name
    end
    attachments[@candidature.generate_transcript_filename] = File.read(@candidature.path_to_transcript)
  end

end
