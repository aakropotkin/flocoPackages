{

  inputs.packument.url   = "https://registry.npmjs.org/rc-input-number?rev=213-54bec81a8d3d3902864a72a486ddf55b";
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
    ident = "rc-input-number";
    ldir  = "info/unscoped/r/rc-input-number";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
