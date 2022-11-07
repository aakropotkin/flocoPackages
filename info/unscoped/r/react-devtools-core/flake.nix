{

  inputs.packument.url   = "https://registry.npmjs.org/react-devtools-core?rev=217-d14b186afc4119148a58a8b55a20a70f";
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
    ident = "react-devtools-core";
    ldir  = "info/unscoped/r/react-devtools-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
