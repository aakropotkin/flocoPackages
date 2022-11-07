{

  inputs.packument.url   = "https://registry.npmjs.org/nomnom?rev=106-3dc2d75d765454c503b111e08a77e357";
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
    ident = "nomnom";
    ldir  = "info/unscoped/n/nomnom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
