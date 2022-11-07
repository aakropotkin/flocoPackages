{

  inputs.packument.url   = "https://registry.npmjs.org/is-obj?rev=10-0919d8d0449f917f521aa67aaa1fdf7f";
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
    ident = "is-obj";
    ldir  = "info/unscoped/i/is-obj";
    inherit packument fetchInfo;
  } // latest';

}
