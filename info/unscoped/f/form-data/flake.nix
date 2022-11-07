{

  inputs.packument.url   = "https://registry.npmjs.org/form-data?rev=134-0b3955b94127e73648b6c756853fed21";
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
    ident = "form-data";
    ldir  = "info/unscoped/f/form-data";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
