{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/utf8?rev=39-10e607671b5e93a4bf50a3c0f76df371";
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
    scope = "@webassemblyjs";
    ident = "@webassemblyjs/utf8";
    ldir  = "info/webassemblyjs/utf8";
    inherit packument fetchInfo;
  } // latest';

}
