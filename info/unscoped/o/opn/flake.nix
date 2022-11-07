{

  inputs.packument.url   = "https://registry.npmjs.org/opn?rev=172-ff6fbaed39f61f50a88275a8206fb60a";
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
    ident = "opn";
    ldir  = "info/unscoped/o/opn";
    inherit packument fetchInfo;
  } // latest';

}
