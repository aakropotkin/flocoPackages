{

  inputs.packument.url   = "https://registry.npmjs.org/asynckit?rev=6-1439bf9993161717edf41eaf56ef3db5";
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
    ident = "asynckit";
    ldir  = "info/unscoped/a/asynckit";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
