{

  inputs.packument.url   = "https://registry.npmjs.org/responselike?rev=12-0947252faaf38fce99f356e600ca5c50";
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
    ident = "responselike";
    ldir  = "info/unscoped/r/responselike";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
