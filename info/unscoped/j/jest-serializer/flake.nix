{

  inputs.packument.url   = "https://registry.npmjs.org/jest-serializer?rev=82-0454c480f5837f0c24351b34cad48294";
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
    ident = "jest-serializer";
    ldir  = "info/unscoped/j/jest-serializer";
    inherit packument fetchInfo;
  } // latest';

}
