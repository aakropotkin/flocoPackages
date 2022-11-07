{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-discard-comments?rev=63-489d3627981aa08526eb6da5c625f0d4";
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
    ident = "postcss-discard-comments";
    ldir  = "info/unscoped/p/postcss-discard-comments";
    inherit packument fetchInfo;
  } // latest';

}
