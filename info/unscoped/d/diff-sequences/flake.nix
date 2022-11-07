{

  inputs.packument.url   = "https://registry.npmjs.org/diff-sequences?rev=77-35e302b8833f195cc5b721d2067cde98";
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
    ident = "diff-sequences";
    ldir  = "info/unscoped/d/diff-sequences";
    inherit packument fetchInfo;
  } // latest';

}
