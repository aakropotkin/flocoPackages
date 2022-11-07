{

  inputs.packument.url   = "https://registry.npmjs.org/graphql-tools?rev=1394-36d751ad77214d874ce1ffc3720ddc23";
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
    ident = "graphql-tools";
    ldir  = "info/unscoped/g/graphql-tools";
    inherit packument fetchInfo;
  } // latest';

}
