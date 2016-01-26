require 'pdftk_forms'
@pdftk = PdftkForms::Wrapper.new
@pdftk.path # => Assume 'pdftk' is already in path

def fill1500(inputFile, outputDirectory)
fields = @pdftk.fields(inputFile)
fields.each {
  | field |
  puts field.name
}

@pdftk.fill_form(inputFile, outputDirectory + "output.pdf", {
  'patientName_2' => 'MyFirstName'
  })
  # Return file string
  #return [something]
end

time = Time.new
dateSaveString = time.strftime('%Y') + "/" + time.strftime('%m') + "/" + time.strftime('%d')

#Create output directories before files are saved in
system 'mkdir', '-p', "output/" + dateSaveString

# Example call to function
fill1500('1500template.pdf', "./output/" + dateSaveString + "/")
