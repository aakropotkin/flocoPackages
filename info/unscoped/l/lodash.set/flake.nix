{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.set?rev=19-89c158804abb9d7f6e6f754c287efb79";
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
    ident = "lodash.set";
    ldir  = "info/unscoped/l/lodash.set";
    inherit packument fetchInfo;
  } // latest';

}
