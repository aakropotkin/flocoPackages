{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/estree-is-function?_rev=1-1cae6dfa5bd0041d3ef7c174c067a051";
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
    ident = "estree-is-function";
    ldir  = "info/unscoped/e/estree-is-function";
    inherit packument fetchInfo;
  } // latest';

}
