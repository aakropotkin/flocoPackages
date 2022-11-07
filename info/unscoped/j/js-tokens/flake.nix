{

  inputs.packument.url   = "https://registry.npmjs.org/js-tokens?rev=34-a5d8c4458d1e023ece456d90a8973a0f";
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
    ident = "js-tokens";
    ldir  = "info/unscoped/j/js-tokens";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
