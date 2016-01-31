require 'pdftk_forms'
@pdftk = PdftkForms::Wrapper.new
@pdftk.path # => Assume 'pdftk' is already in path

def fill1500(inputFile, outputDirectory, fieldValues)
fields = @pdftk.fields(inputFile)
fields.each {
  | field |
  puts field.name
}

puts
puts

fieldValues.each do |key, value|
    puts key + " -- " + value
end

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

# The following two hashes will need to be loaded from a file
patientAccount = {
    "accesssionNumber" => "0",
    "aNumber" => "1",
    "pNumber" => "0",
    "cNumber" => "0",
    "providerNPINumber" => "0",
    "providerName" => "0",
    "firstName" => "0",
    "middleName" => "0",
    "lastName" => "0",
    "patientDOB" => "0",
    "gender" => "0",
    "patientPhone" => "0",
    "collectionDate" => "0",
    "patientAddress" => "0",
    "employerName" => "0",
    "carrier1" => "0",
    "carrier1ClaimAddress" => "0",
    "subscriber1Name" => "0",
    "subscriber1DOB" => "0",
    "subscriber1ID" => "0",
    "group1Number" => "0",
    "carrier2" => "0",
    "carrier2ClaimAddress" => "0",
    "subscriber2Name" => "0",
    "subscriber2DOB" => "0",
    "subscriber2ID" => "0",
    "group2Number" => "0",
    "carrier1" => "0",
    "carrier1ClaimAddress" => "0",
    "subscriber1Name" => "0",
    "subscriber1DOB" => "0",
    "subscriber1ID" => "0",
}
charges = {
    "accesssionNumber" => "0",
    "collectionDate" => "0",
    "chargeCode_CPT" => "0",
    "units" => "0",
    "modifier" => "0",
    "amount" => "0",
    "dx1" => "0",
    "dx2" => "0",
    "dx3" => "0",
    "dx4" => "0",
    "dx5" => "0",
    "dx6" => "0",
    "dx7" => "0",
    "dx8" => "0",
    "dx9" => "0",
    "dx10" => "0",
}
# Example call to function
fill1500('1500template.pdf', "./output/" + dateSaveString + "/", fillVals)
