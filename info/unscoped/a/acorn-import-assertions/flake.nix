{

  inputs.packument.url   = "https://registry.npmjs.org/acorn-import-assertions";
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
    ident = "acorn-import-assertions";
    ldir  = "info/unscoped/a/acorn-import-assertions";
    inherit packument fetchInfo;
  } // latest';

}
