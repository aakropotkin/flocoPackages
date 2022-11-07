{

  inputs.packument.url   = "https://registry.npmjs.org/css-blank-pseudo?rev=15-c15438bff8b828c1721012c28a19be4e";
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
    ident = "css-blank-pseudo";
    ldir  = "info/unscoped/c/css-blank-pseudo";
    inherit packument fetchInfo;
  } // latest';

}
