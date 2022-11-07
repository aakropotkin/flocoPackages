{

  inputs.packument.url   = "https://registry.npmjs.org/utils-merge?rev=21-1844a8bc6cb30b3bd24e321737f2ed93";
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
    ident = "utils-merge";
    ldir  = "info/unscoped/u/utils-merge";
    inherit packument fetchInfo;
  } // latest';

}
