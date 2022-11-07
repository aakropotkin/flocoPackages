{

  inputs.packument.url   = "https://registry.npmjs.org/command-line-args?rev=157-39cff8f7d3479a4fc087a5e227cc22c0";
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
    ident = "command-line-args";
    ldir  = "info/unscoped/c/command-line-args";
    inherit packument fetchInfo;
  } // latest';

}
