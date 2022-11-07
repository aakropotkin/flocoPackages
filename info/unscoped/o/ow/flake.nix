{

  inputs.packument.url   = "https://registry.npmjs.org/ow?rev=52-c1f19dbfca9886187ff12e59836df83c";
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
    ident = "ow";
    ldir  = "info/unscoped/o/ow";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
