{

  inputs.packument.url   = "https://registry.npmjs.org/doctypes?rev=12-e234fc080b5f48a7ac5177508a7502a4";
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
    ident = "doctypes";
    ldir  = "info/unscoped/d/doctypes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
