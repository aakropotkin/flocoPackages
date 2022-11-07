{

  inputs.packument.url   = "https://registry.npmjs.org/react-side-effect?rev=31-e2e81969be0faa38102f608f11669e58";
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
    ident = "react-side-effect";
    ldir  = "info/unscoped/r/react-side-effect";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
