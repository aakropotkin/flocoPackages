{

  inputs.packument.url   = "https://registry.npmjs.org/vinyl-fs?rev=121-102351b94e14fef1501b2cf5806bd386";
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
    ident = "vinyl-fs";
    ldir  = "info/unscoped/v/vinyl-fs";
    inherit packument fetchInfo;
  } // latest';

}
