{

  inputs.packument.url   = "https://registry.npmjs.org/react-datepicker?rev=196-bcc30915442a7dba65ab0e1933636d92";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "react-datepicker";
    ldir  = "info/unscoped/r/react-datepicker";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
