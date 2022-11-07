{

  inputs.packument.url   = "https://registry.npmjs.org/nano-json-stream-parser?rev=4-bf1dd82801f4889edbb6ce54650e7bce";
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
    ident = "nano-json-stream-parser";
    ldir  = "info/unscoped/n/nano-json-stream-parser";
    inherit packument fetchInfo;
  } // latest';

}
