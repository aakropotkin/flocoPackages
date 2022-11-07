{

  inputs.packument.url   = "https://registry.npmjs.org/mz?rev=107-9e65d4f75919bb5695570c7654a265e1";
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
    ident = "mz";
    ldir  = "info/unscoped/m/mz";
    inherit packument fetchInfo;
  } // latest';

}
