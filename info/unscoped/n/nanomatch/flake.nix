{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nanomatch?_rev=39-dcf49e4555bbe7f23c7a2668effdbfb6";
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
    ident = "nanomatch";
    ldir  = "info/unscoped/n/nanomatch";
    inherit packument fetchInfo;
  } // latest';

}
