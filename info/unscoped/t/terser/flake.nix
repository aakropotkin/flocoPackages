{

  inputs.packument.url   = "https://registry.npmjs.org/terser?rev=134-8d0a4cb6da3a1b64d311656d3ea5d7c0";
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
    ident = "terser";
    ldir  = "info/unscoped/t/terser";
    inherit packument fetchInfo;
  } // latest';

}
