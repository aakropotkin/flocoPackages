{

  inputs.packument.url   = "https://registry.npmjs.org/bufferstreams?rev=19-96da6f060bd5586991d3baebe369ff76";
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
    ident = "bufferstreams";
    ldir  = "info/unscoped/b/bufferstreams";
    inherit packument fetchInfo;
  } // latest';

}
