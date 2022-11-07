{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.uniq?rev=54-b04e2824b08e77dd05c3a12cdb02e9cf";
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
    ident = "lodash.uniq";
    ldir  = "info/unscoped/l/lodash.uniq";
    inherit packument fetchInfo;
  } // latest';

}
