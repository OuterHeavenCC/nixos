{ pkgs, lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "signpdf";
  version = "0.0.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-UPBgB/m/MK0wLy52/wHiW79LlEpHV1VejuwTRZmrtZA=";
  };
  doCheck = false;

  propagatedBuildInputs = with pkgs; [ 
    python310Packages.reportlab
    python310Packages.pypdf2
  ];

  meta = {
    homepage = "https://github.com/yourcelf/signpdf";
    description = "Python script to add signature images to PDFs ";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ OuterHeavenCC ];
  };
}
