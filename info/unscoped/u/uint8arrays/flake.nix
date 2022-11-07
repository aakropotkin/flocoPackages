{

  inputs.packument.url   = "https://registry.npmjs.org/uint8arrays?rev=30-24b1fd445546cdd4ac8795cd6d124575";
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
    ident = "uint8arrays";
    ldir  = "info/unscoped/u/uint8arrays";
    inherit packument fetchInfo;
  } // latest';

}
