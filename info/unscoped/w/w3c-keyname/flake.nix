{

  inputs.packument.url   = "https://registry.npmjs.org/w3c-keyname?rev=23-78bd027b0ba35c6639cc9e2ef152e593";
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
    ident = "w3c-keyname";
    ldir  = "info/unscoped/w/w3c-keyname";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
