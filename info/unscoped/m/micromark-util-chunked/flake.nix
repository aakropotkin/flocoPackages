{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-chunked?rev=5-6853c3110d7ae644aa079614b7526e94";
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
    ident = "micromark-util-chunked";
    ldir  = "info/unscoped/m/micromark-util-chunked";
    inherit packument fetchInfo;
  } // latest';

}
