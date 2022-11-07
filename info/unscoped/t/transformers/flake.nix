{

  inputs.packument.url   = "https://registry.npmjs.org/transformers?rev=53-fa92603fb55072348332ed8f17022051";
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
    ident = "transformers";
    ldir  = "info/unscoped/t/transformers";
    inherit packument fetchInfo;
  } // latest';

}
