{

  inputs.packument.url   = "https://registry.npmjs.org/less-loader?rev=128-f08714c4a6b195eda06faefa966097f3";
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
    ident = "less-loader";
    ldir  = "info/unscoped/l/less-loader";
    inherit packument fetchInfo;
  } // latest';

}
