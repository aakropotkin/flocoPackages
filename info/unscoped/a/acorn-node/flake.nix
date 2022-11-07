{

  inputs.packument.url   = "https://registry.npmjs.org/acorn-node?rev=27-fad6a35c5582117468197403c5db2fc0";
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
    ident = "acorn-node";
    ldir  = "info/unscoped/a/acorn-node";
    inherit packument fetchInfo;
  } // latest';

}
